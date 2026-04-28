import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getSuppliers, createSupplier, updateSupplier, deleteSupplier,
  getSupplierComparison, upsertSupplierPrice
} from '../controllers/supplier.controller';

const router = Router();

router.use(authenticate);

router.get('/', getSuppliers);
router.post('/', authorize('ADMIN', 'FINANCE'), createSupplier);
router.put('/:id', authorize('ADMIN', 'FINANCE'), updateSupplier);
router.delete('/:id', authorize('ADMIN'), deleteSupplier);
router.get('/comparison', getSupplierComparison);
router.post('/price', authorize('ADMIN', 'FINANCE'), upsertSupplierPrice);

export default router;
