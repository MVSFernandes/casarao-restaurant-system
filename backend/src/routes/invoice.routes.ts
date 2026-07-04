import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import { createInvoice, getInvoice } from '../controllers/invoice.controller';

const router = Router();

router.use(authenticate);
router.use(authorize('ADMIN', 'FINANCE'));

router.post('/', createInvoice);
router.get('/:id', getInvoice);

export default router;
