import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserRepository } from '../repositories/user.repository';
import { User } from '@prisma/client';

export class AuthService {
  constructor(private userRepository: UserRepository) {}

  async login(email: string, password: string): Promise<{ accessToken: string; refreshToken: string; user: Omit<User, 'password'> }> {
    const user = await this.userRepository.findByEmail(email);
    if (!user) {
      throw new Error('Invalid credentials');
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      throw new Error('Invalid credentials');
    }

    const { password: _, ...userWithoutPassword } = user;

    const accessToken = this.generateAccessToken(userWithoutPassword);
    const refreshToken = this.generateRefreshToken(userWithoutPassword);

    return { accessToken, refreshToken, user: userWithoutPassword };
  }

  async refreshToken(token: string): Promise<{ accessToken: string }> {
    try {
      const decoded = jwt.verify(token, process.env.JWT_REFRESH_SECRET!) as { id: string };
      const user = await this.userRepository.findById(decoded.id);

      if (!user) {
        throw new Error('User not found');
      }
      
      const { password: _, ...userWithoutPassword } = user;

      const accessToken = this.generateAccessToken(userWithoutPassword);
      return { accessToken };
    } catch (error) {
      throw new Error('Invalid refresh token');
    }
  }

  private generateAccessToken(user: Omit<User, 'password'>): string {
    return jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET!, {
      expiresIn: (process.env.JWT_EXPIRES_IN || '15m') as any,
    });
  }

  private generateRefreshToken(user: Omit<User, 'password'>): string {
    return jwt.sign({ id: user.id }, process.env.JWT_REFRESH_SECRET!, {
      expiresIn: (process.env.JWT_REFRESH_EXPIRES_IN || '7d') as any,
    });
  }
}

