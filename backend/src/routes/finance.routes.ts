import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getPayables,
  createPayable,
  markAsPaid,
  getFinanceReports,
  updatePayable,
  deletePayable,
} from '../controllers/finance.controller';

const router = Router();

router.use(authenticate);
router.use(authorize('ADMIN', 'FINANCE'));

router.get('/reports', getFinanceReports);
router.get('/payables', getPayables);
router.post('/payables', createPayable);
router.put('/payables/:id', updatePayable);
router.delete('/payables/:id', deletePayable);
router.patch('/payables/:id/pay', markAsPaid);

export default router;