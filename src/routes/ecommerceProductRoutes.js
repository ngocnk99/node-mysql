import { Router } from 'express';

import ecommerceProductValidate from '../validates/ecommerceProductValidate';
import ecommerceProductController from '../controllers/ecommerceProductController';

const router = Router();

router.get('/', ecommerceProductValidate.authenFilter, ecommerceProductController.get_list);
// router.get("/get/all", ecommerceProductValidate.authenFilter, ecommerceProductController.get_all)
router.get('/:id', ecommerceProductController.get_one);
router.post('/', ecommerceProductValidate.authenCreate, ecommerceProductController.create);
router.put('/:id', ecommerceProductValidate.authenUpdate, ecommerceProductController.update);
router.delete('/:id', ecommerceProductController.delete);
export default router;
