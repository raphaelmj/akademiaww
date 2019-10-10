const nodemailer = require('nodemailer');
const mailConfig = require('../../config/mail')


class ApiController{

    sendEmail(req,res){

        nodemailer.createTestAccount((err, account) => {
            // create reusable transporter object using the default SMTP transport
            let transporter = nodemailer.createTransport({
                host: mailConfig.host,
                port: 587,
                secure: false, // true for 465, false for other ports
                auth: {
                    user: mailConfig.user, // generated ethereal user
                    pass: mailConfig.pass // generated ethereal password
                }
            });

            

            // setup email data with unicode symbols
            let mailOptions = {
                from: '"Strona drdieta.com.pl" <'+req.body.clientemail+'>', // sender address
                to: 'raphaelmaj@gmail.com, kontakt@dr-dieta.com', // list of receivers
                subject: 'Kontakt ze strony od '+req.body.clientemail, // Subject line
                text: 'Hello world?', // plain text body
                html: '<table style="width: 600px;" cellpadding="0" cellspacing="0">'
                        +'<tr>' +
                        '<td style="border-bottom:1px solid #E855B7;border-right:1px solid #E855B7;">Imię:</td><td style="border-bottom:1px solid #E855B7;">'+req.body.name+'</td>'+
                        '</tr>'
                        +'<tr>' +
                        '<td style="border-bottom:1px solid #E855B7;border-right:1px solid #E855B7;">Email:</td><td style="border-bottom:1px solid #E855B7;">'+req.body.clientemail+'</td>'+
                        '</tr>'
                        +'<tr>' +
                        '<td style="border-bottom:1px solid #E855B7;border-right:1px solid #E855B7;">Telefon:</td><td style="border-bottom:1px solid #E855B7;">'+req.body.phone+'</td>'+
                        '</tr>'
                        +'<tr>' +
                        '<td style="border-bottom:1px solid #E855B7;border-right:1px solid #E855B7;">Wiadomość:</td><td style="border-bottom:1px solid #E855B7;">'+req.body.message+'</td>'+
                        '</tr>'+
                       '</table>'
            };

            // send mail with defined transport object
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    return res.json(error);
                }
                // console.log('Message sent: %s', info.messageId);
                // Preview only available when sending through an Ethereal account
                // console.log('Preview URL: %s', nodemailer.getTestMessageUrl(info));

                // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
                // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...

                return res.json({success:true})

            });
        });

        // return res.json(req.body);
    }




}

module.exports = new ApiController();