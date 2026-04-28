import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getTodayMarmitaMenu,
  getMarmitaMenuByDay,
  createMarmitaMenuItem,
  updateMarmitaMenuItem,
  deleteMarmitaMenuItem,
} from '../controllers/marmitaMenu.controller';

const router = Router();

router.get('/today', authenticate, getTodayMarmitaMenu);
router.get('/day/:dayOfWeek', authenticate, getMarmitaMenuByDay);

router.post('/', authenticate, authorize('ADMIN'), createMarmitaMenuItem);
router.patch('/:id', authenticate, authorize('ADMIN'), updateMarmitaMenuItem);
router.delete('/:id', authenticate, authorize('ADMIN'), deleteMarmitaMenuItem);

export default router;