const jwt  = require('jsonwebtoken');
const conn = require('../dbConnection').promise();

exports.getUser = async (req,res,next) => {

    try{

        if(
            !req.headers.authorization ||
            !req.headers.authorization.startsWith('Bearer') ||
            !req.headers.authorization.split(' ')[1]
        ){
            return res.status(422).json({
                message: "Please provide the token",
            });
        }

        const theToken = req.headers.authorization.split(' ')[1];
        const decoded  = jwt.verify(theToken, 'the-super-strong-secrect');

        const [row] = await conn.execute(
            "SELECT ud.nik,ud.nama,ud.tempat_lahir,ud.tgl_lahir,ud.jenis_kelamin,ud.alamat from users u left join userdetails ud on u.id=ud.user_id where u.id=?",
            [decoded.id]
        );

        if(row.length > 0){
            return res.json({
                status:200,
                message:'success',
                data:row[0]
            });
        }

        res.json({
            status:401,
            message:"No user found",
            data:[]
        });
        
    }
    catch(err){
        next(err);
    }
}