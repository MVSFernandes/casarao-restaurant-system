import { useAuthStore } from '../store/authStore';
import api from '../services/api';
import type { User } from '../types';

export const useAuth = () => {
  const { user, isAuthenticated, login, logout } = useAuthStore();

  const signIn = async (email: string, password: string): Promise<User> => {
    const { data } = await api.post('/auth/login', { email, password });
    login(data.user, data.accessToken);
    return data.user;
  };

  const signOut = async () => {
    try {
      await api.post('/auth/logout');
    } finally {
      logout();
    }
  };

  return { user, isAuthenticated, signIn, signOut };
};
