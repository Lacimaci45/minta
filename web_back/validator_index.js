//express csomag beszúrása
const express=require('express');
//cors csomag beszúrása 
const cors=require('cors');
//express validator behívása
const {body,check,validationResult}=require('express-validator');
// express csomagból lesz az app létrehozva és működtetve
const app=express();

//app. amit haszmál az app + bodyban lévő adatok elérése app.use.....
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));

//szerver port + üzenet
app.listen(8000,()=>{console.log("Server is running")});

//végpontok
app.get('/', (req, res)=>{
    res.send("<h1>Input validate</h1>");
});

//rest client kiegészítő telepítése+validator végpontok létrehozása
app.post(
    '/reg',
    body('username').blacklist("<>()/\'\"").isLength({min:4,max:20}).withMessage("A username min 4 karakter hosszú legyen!").escape(),
    body('email').isEmail().withMessage("Em-mail címet kell megadni!"),
    body('password').isLength({min:5}).withMessage("A jelszó minimum 5 karakter!"),
    body('lakcim').blacklist("<>()/\'\"").isLength({min:10,max:100}).withMessage("A lakcím min 10 karakter!").escape(),
    (req,res)=>
    {
        const errors=validationResult(req);
        if(!errors.isEmpty()){
        res.status(400).json({Hibák:errors.array()});
        } 
        else{
            const username=req.body.username;
            const email=req.body.email;
            const lakcim=req.body.lakcim;
    
            res.send(
                "<p>"+username+"</p>"+
                "<p>"+email+"</p>"+
                "<p>"+lakcim+"</p>"
            );
        }
    }
);

app.get('/marka/:marka/kor/:kor', 
    check('marka').escape().isLength({min:2}).withMessage("Túl rövid a megadott márka neve!"),
    check('kor').isNumeric().withMessage("A kornál számot kell tartalmaznia!"),
    (req,res)=>
    {

        const errors=validationResult(req);
        if (!errors.isEmpty())
        {
        res.status(400).json({"Hibák": errors.array()});
        }
        else
        {
        res.json({"marka":req.params.marka, "kor":req.params.kor});
        }
    }
);





