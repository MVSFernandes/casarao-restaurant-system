import { Request, Response } from 'express';
import { authService } from '../services/auth.service';

export const login = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }

    const { accessToken, refreshToken, user } = await authService.login(email, password);

    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      path: '/api/auth/refresh-token',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    res.json({ accessToken, user });
  } catch (error: any) {
    res.status(401).json({ message: error.message });
  }
};

export const refreshToken = async (req: Request, res: Response) => {
  try {
    const { refreshToken } = req.cookies;
    if (!refreshToken) {
      return res.status(401).json({ message: 'Refresh token not found' });
    }
    const { accessToken } = await authService.refreshToken(refreshToken);
    res.json({ accessToken });
  } catch (error: any) {
    res.status(401).json({ message: error.message });
  }
};

export const logout = (_req: Request, res: Response) => {
  res.clearCookie('refreshToken', { path: '/api/auth/refresh-token' });
  res.status(200).json({ message: 'Logged out successfully' });
};

export const getMe = async (req: Request, res: Response) => {
  try {
    const user = (req as any).user;
    if (!user) return res.status(404).json({ message: 'User not found' });
    const currentUser = await authService.getMe(user.id);
    res.json(currentUser);
  } catch (error: any) {
    res.status(500).json({ message: 'Internal server error' });
  }
};