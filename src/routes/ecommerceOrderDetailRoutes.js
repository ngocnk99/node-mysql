import { Router } from 'express';

import ecommerceOrderDetailValidate from '../validates/ecommerceOrderDetailValidate';
import ecommerceOrderDetailController from '../controllers/ecommerceOrderDetailController';

const router = Router();

router.get('/', ecommerceOrderDetailValidate.authenFilter, ecommerceOrderDetailController.get_list);
router.get('/:id', ecommerceOrderDetailController.get_one);
router.post('/', ecommerceOrderDetailValidate.authenCreate, ecommerceOrderDetailController.create);
router.put('/:id', ecommerceOrderDetailValidate.authenUpdate, ecommerceOrderDetailController.update);
export default router;
