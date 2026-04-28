import { Router } from 'express';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import { getConfig, updateConfig } from '../controllers/config.controller';

const router = Router();

router.get('/', getConfig);
router.put('/', authenticate, authorize('ADMIN'), updateConfig);

export default router;
