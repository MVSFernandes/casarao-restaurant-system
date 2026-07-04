import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import {
  getCustomers,
  getCustomerCredits,
  getCustomerCredit,
  createCustomer,
  updateCustomer,
  deleteCustomer,
  payCredit,
  addCreditCharge,
} from '../controllers/customer.controller';

const router = Router();

router.use(authenticate);

router.get('/credit', getCustomerCredits);
router.get('/', getCustomers);
router.get('/:id/credit', getCustomerCredit);
router.post('/', createCustomer);
router.put('/:id', updateCustomer);
router.delete('/:id', authorize('ADMIN'), deleteCustomer);
router.post('/:id/payments', payCredit);
router.post('/:id/pay-credit', payCredit);
router.post('/:id/charge-credit', addCreditCharge);

export default router;
