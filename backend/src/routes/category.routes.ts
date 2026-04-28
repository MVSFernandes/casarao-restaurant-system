import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getCategories, getCategoryById, createCategory, updateCategory, deleteCategory
} from '../controllers/category.controller';

const router = Router();

router.get('/', getCategories);
router.get('/:id', getCategoryById);
router.post('/', authenticate, authorize('ADMIN'), createCategory);
router.put('/:id', authenticate, authorize('ADMIN'), updateCategory);
router.delete('/:id', authenticate, authorize('ADMIN'), deleteCategory);

export default router;
