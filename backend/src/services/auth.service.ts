import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { userRepository } from '../repositories/user.repository';
import { User } from '../types/domain';

export type UserPublic = Omit<User, 'password'>;

export interface LoginResult {
  accessToken: string;
  refreshToken: string;
  user: UserPublic;
}

const generateAccessToken = (user: UserPublic): string =>
  jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET!, {
    expiresIn: (process.env.JWT_EXPIRES_IN || '15m') as any,
  });

const generateRefreshToken = (user: UserPublic): string =>
  jwt.sign({ id: user.id }, process.env.JWT_REFRESH_SECRET!, {
    expiresIn: (process.env.JWT_REFRESH_EXPIRES_IN || '7d') as any,
  });

export const authService = {
  async login(email: string, password: string): Promise<LoginResult> {
    const user = await userRepository.findByEmail(email);
    if (!user) throw new Error('Invalid credentials');

    const valid = await bcrypt.compare(password, user.password);
    if (!valid) throw new Error('Invalid credentials');

    const { password: _, ...userPublic } = user;
    return {
      accessToken: generateAccessToken(userPublic),
      refreshToken: generateRefreshToken(userPublic),
      user: userPublic,
    };
  },

  async refreshToken(token: string): Promise<{ accessToken: string }> {
    try {
      const decoded = jwt.verify(token, process.env.JWT_REFRESH_SECRET!) as { id: string };
      const user = await userRepository.findById(decoded.id);
      if (!user) throw new Error('User not found');

      const { password: _, ...userPublic } = user;
      return { accessToken: generateAccessToken(userPublic) };
    } catch {
      throw new Error('Invalid refresh token');
    }
  },

  async getMe(userId: string): Promise<UserPublic> {
    const user = await userRepository.findById(userId);
    if (!user) throw new Error('User not found');
    const { password: _, ...userPublic } = user;
    return userPublic;
  },
};