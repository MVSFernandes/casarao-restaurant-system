import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getStockItems,
  getStockItemById,
  getLowStockItems,
  createStockItem,
  updateStockItem,
  deleteStockItem,
} from '../controllers/stock.controller';

const router = Router();

router.use(authenticate);

router.get('/', getStockItems);
router.get('/low', getLowStockItems);
router.get('/:id', getStockItemById);
router.post('/', authorize('ADMIN', 'FINANCE'), createStockItem);
router.put('/:id', authorize('ADMIN', 'FINANCE'), updateStockItem);
router.delete('/:id', authorize('ADMIN'), deleteStockItem);

export default router;