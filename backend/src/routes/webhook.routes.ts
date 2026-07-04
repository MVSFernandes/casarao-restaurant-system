import { Router } from 'express';
import { receiveFocusWebhook } from '../controllers/invoice.controller';

const router = Router();

router.post('/focus-nfe', receiveFocusWebhook);

export default router;
