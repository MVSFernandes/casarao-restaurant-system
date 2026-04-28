import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getLinksByProduct,
  replaceLinksByProduct,
} from '../controllers/productStockLink.controller';

const router = Router();

router.use(authenticate);

router.get('/product/:productId', authorize('ADMIN', 'FINANCE'), getLinksByProduct);
router.put('/product/:productId', authorize('ADMIN', 'FINANCE'), replaceLinksByProduct);

export default router;