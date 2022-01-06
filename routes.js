const router = require('express').Router();
const {body} = require('express-validator');
const {register} = require('./controllers/registerController');
const {login} = require('./controllers/loginController');
const {getUser} = require('./controllers/getUserController');
const { register_ktp } = require('./controllers/ktpController');

router.post('/register', [
    body('name',"The name must be of minimum 3 characters length") .notEmpty() .escape() .trim() .isLength({ min: 3 }),
    body('email',"Invalid email address") .notEmpty() .escape() .trim().isEmail(),
    body('password',"The Password must be of minimum 4 characters length").notEmpty().trim().isLength({ min: 4 }),
], register);

router.post('/login',[
    body('email',"Invalid email address") .notEmpty() .escape() .trim().isEmail(),
    body('password',"The Password must be of minimum 4 characters length").notEmpty().trim().isLength({ min: 4 }),
],login);

router.post('/register_ktp', [
    body('nama',"The name must be of minimum 3 characters length") .notEmpty() .escape() .trim() .isLength({ min: 3 }),
    body('nik',"The NIK must be number 16 characters length") .notEmpty().trim().isLength({ max: 16 }),
    body('tgl_lahir',"required").notEmpty().trim(),
    body('jenis_kelamin',"required").notEmpty().trim(),
    body('alamat',"required").notEmpty().trim(),
    body('agama',"required").notEmpty().trim(),
    body('status_perkawinan',"required").notEmpty().trim(),
    body('pekerjaan',"required").notEmpty().trim(),
    body('kewarganegaraan',"required").notEmpty().trim(),
    body('masa_berlaku',"required").notEmpty().trim(),
    body('rt_rw',"required").notEmpty().trim(),
    body('kelurahan',"required").notEmpty().trim(),
    body('kecamatan',"required").notEmpty().trim(),
], register_ktp);

router.get('/getuser',getUser);

module.exports = router;