var blockchain = require("./index");

var address = "0x6DeFAd2d9841203B9C7062c143FEd7295d065aaE";
var privateKey = "2c950eba9f6ddbc30db5d607f8db31b4aed7fa12fa9f74b8997cb09fb9af609e";
var BlockChain  = new blockchain(address, privateKey);



/*BlockChain.getStatus("lop1").then(function(res){
    console.log(res);
});*/

    //["2019-2020-I-3-CMU-SE252HIS", "2019-2020-II-4-IS384AIS", "2020-2021-I-5-IS301P", "2020-2021-II-6-CMU-CS447AIS", "2019-2020-I-7-CMU-CS311AIS", "2019-2020-I-9-TEST", "2019-2020-II-12-TEST1"]
/*BlockChain.getAll("lop1").then(function(re){
    //    re = JSON.stringify(re);
        console.log(re);
    });

    BlockChain.getAll1sv(["lop1", "lop2"], "1221").then(function(re){
        //    re = JSON.stringify(re);
            console.log(re);
    });*/

/*



BlockChain.get1sv("lop1", "1221").then(function(re){
    //    re = JSON.stringify(re);
        console.log(re);
    });
    
    
    ;
    
    BlockChain.getAll("lop2").then(function(re){
        //    re = JSON.stringify(re);
            console.log(re);
        });


*/

/*
var a = "30";
a = 2.9545;
console.log(a.toFixed(4));
console.log(a.toFixed(2));


var txt = "#div-name-1234-characteristic:561613213213";
var numb = txt.match(/\d/g);
numb = numb.join("")
console.log(numb);
console.log(typeof(numb.lastIndexOf("6")));




*/
/*
BlockChain.addgr("lop1", ["10", "10", "10"], 1).then(function(re){
    console.log(re);
});

BlockChain.addsv("lop2", ["1221", "1222", "1223"]).then(function(re){
    console.log(re);
});

BlockChain.addper(["a-10", "b-20", "c-50"], "lop2").then(function(re){
    console.log(re);
});

*/

/*
var getTransaction = require("./getTransaction");
var GetTransaction = new getTransaction("0x77aae92c578325f29af947de2910a5cdd0ff23bcb61e41e87cefd30e33263173");

GetTransaction.Input().then(function(re){
    console.log(JSON.stringify(re));
});

GetTransaction.Fee().then(function(re){
    console.log(JSON.stringify(re));
});


*/
