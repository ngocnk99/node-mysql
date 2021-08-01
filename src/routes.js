import { Router } from 'express';

import swaggerSpec from './utils/swagger';

import ecommerceProductRoutes from './routes/ecommerceProductRoutes';
import ecommerceOrderRoutes from './routes/ecommerceOrderRoutes';
import ecommerceOrderDetailRoutes from './routes/ecommerceOrderDetailRoutes'

/**
 * Contains all API routes for the application.
 */
const router = Router();

/**
 * GET /swagger.json
 */
router.get('/swagger.json', (req, res) => {
  res.json(swaggerSpec);
});

/**
 * GET /api
 */
router.get('/', (req, res) => {
  res.json({
    app: req.app.locals.title,
    apiVersion: req.app.locals.version
  });
});

router.use('/c/ecommerceProducts', ecommerceProductRoutes);
router.use('/c/ecommerceOrders', ecommerceOrderRoutes);
router.use('/c/ecommerceOrderDetails', ecommerceOrderDetailRoutes);

export default router;
