const jwt                = require('jsonwebtoken');
const {validationResult} = require('express-validator');
const bcrypt             = require('bcryptjs');
const conn               = require('../dbConnection').promise();

exports.register_ktp = async(req,res,next) => {
    const errors = validationResult(req);

    if(!errors.isEmpty()){
        return res.status(422).json({ errors: errors.array() });
    }

    try{
        
        const cek_angka = /^[0-9]+$/;
        if(!req.headers.authorization ||!req.headers.authorization.startsWith('Bearer') ||!req.headers.authorization.split(' ')[1]){
            return res.status(422).json({
                message: "Please provide the token",
            });
        }

        if (!req.body.tgl_lahir.match(cek_angka))
        {
            return res.status(500).json({
                status:500,
                message:"Tanggal lahir harus 'yyyy/mm/dd'",
                data:[]
            });
        }

        const theToken = req.headers.authorization.split(' ')[1];
        const decoded  = jwt.verify(theToken, 'the-super-strong-secrect');

        const [row] = await conn.execute(
            "SELECT `id`,`name`,`email` FROM `users` WHERE `id`=?",
            [decoded.id]
        );

        
        if(!req.body.nik.match(cek_angka))
        {
            return res.status(500).json({
                status:500,
                message:"NIK must be Number !!",
                data:[]
            });
        }

        if(row.length > 0)
        {
            const [rows] = await conn.execute('INSERT INTO `userdetails`(`user_id`,`nik`,`nama`,`tgl_lahir`,`tempat_lahir`,`jenis_kelamin`,`alamat`,`agama`,`status_perkawinan`,`pekerjaan`,`kewarganegaraan`,`masa_berlaku`,`rt_rw`,`kelurahan`,`kecamatan`,`createdAt`,`updatedAt`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),NOW())',[
                decoded.id,
                req.body.nik,
                req.body.nama,
                req.body.tgl_lahir,
                req.body.tempat_lahir,
                req.body.jenis_kelamin,
                req.body.alamat +' RT/RW '+ req.body.rt_rw + ' Kelurahan ' + req.body.kelurahan + ' Kecamatan ' + req.body.kecamatan,
                req.body.agama,
                req.body.status_perkawinan,
                req.body.pekerjaan,
                req.body.kewarganegaraan,
                req.body.masa_berlaku,
                req.body.rt_rw,
                req.body.kelurahan,
                req.body.kecamatan
            ]);
    
            if (rows.affectedRows === 1) {
                return res.status(201).json({
                    message: "The user details has been successfully inserted.",
                });
            }

            return res.json({
                status:200,
                message:'success',
                data:row[0]
            });
        }
        
    }catch(err){
        next(err);
    }
}