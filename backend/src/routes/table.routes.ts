import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getTables, getTableById, createTable, updateTableStatus, deleteTable
} from '../controllers/table.controller';

const router = Router();

router.use(authenticate);

router.get('/', getTables);
router.get('/:id', getTableById);
router.post('/', authorize('ADMIN'), createTable);
router.patch('/:id/status', authorize('ADMIN', 'CASHIER', 'WAITER'), updateTableStatus);
router.delete('/:id', authorize('ADMIN'), deleteTable);

export default router;
