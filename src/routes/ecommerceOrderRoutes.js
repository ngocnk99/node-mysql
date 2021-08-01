import { Router } from 'express';

import ecommerceOrderValidate from '../validates/ecommerceOrderValidate';
import ecommerceOrderController from '../controllers/ecommerceOrderController';

const router = Router();

router.get('/', ecommerceOrderValidate.authenFilter, ecommerceOrderController.get_list);
router.get('/:id', ecommerceOrderController.get_one);
router.post('/', ecommerceOrderValidate.authenCreate, ecommerceOrderController.create);
router.put('/:id', ecommerceOrderValidate.authenUpdate, ecommerceOrderController.update);
export default router;
