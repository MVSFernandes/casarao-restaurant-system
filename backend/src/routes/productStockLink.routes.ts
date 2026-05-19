import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getLinksByProduct,
  replaceLinksByProduct,
} from '../controllers/productStockLink.controller';

const router = Router();

// GET não exige auth — frontend usa sem token pra verificar vínculos na tela de produtos
router.get('/product/:productId', getLinksByProduct);

// PUT exige auth — só admin/finance pode alterar vínculos
router.put('/product/:productId', authenticate, authorize('ADMIN', 'FINANCE'), replaceLinksByProduct);

export default router;