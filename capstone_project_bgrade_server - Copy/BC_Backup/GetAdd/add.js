const Web3 = require('web3');
const rpcURL = 'https://ropsten.infura.io/v3/83f81ef97be34ecfa6700d58a6673888';
const web3 = new Web3(rpcURL)
var abi = require("./abi");

function add(address, privateKey){
    this.address = address;
    this.privateKey = privateKey;
    this.contractAddress = '0xbD95025276b0d7B77261aE1c4Eae59106d4867A2';
    this.abi = abi;
    this.myAbi = new web3.eth.Contract(this.abi);
    this.myAbi.options.address = this.contractAddress;
    this.myAbi.options.gasPrice = '20000000000000' ; // default gas price in wei
    this.myAbi.options.gas = 5000000 ;
    
}

add.prototype.addsv_perc = async function(ml, listsv, perc){
    //list sv la mang string.
    var encodedABI = this.myAbi.methods.addsv_perc(listsv, ml, perc).encodeABI();
    var Tx = require('ethereumjs-tx').Transaction
    var private_Key_1 = new Buffer.from(this.privateKey,'hex');
    this.res;
    var txCount = await web3.eth.getTransactionCount(this.address);
    try {
        const ob ={
            from: this.address,
            nonce: web3.utils.toHex(txCount),
            to: this.contractAddress,
            data: encodedABI,
            gasLimit: web3.utils.toHex(3000000),
            gasPrice: web3.utils.toHex(web3.utils.toWei('40','gwei')),
            chainId:3
        }
        const tx = new Tx(ob, {chain:'ropsten', hardfork: 'petersburg'});
        tx.sign(private_Key_1);
        const serializedTransaction =tx.serialize();
        const raw ='0x'+serializedTransaction.toString('hex');

        return await web3.eth.sendSignedTransaction(raw, async (err,txHash) => {
            if (err) return 1;
            
        });
        
        
    }
    catch(error){
        console.log(error);
        return 1;
    }
    
};

add.prototype.addgr = async function(ml, listGr, id){
    var encodedABI = this.myAbi.methods.addgrades(ml, listGr, id).encodeABI();
    var Tx = require('ethereumjs-tx').Transaction
    var private_Key_1 = new Buffer.from(this.privateKey,'hex')
    this.res;
    var txCount = await web3.eth.getTransactionCount(this.address); 
    try {
        const ob ={
            from: this.address,
            nonce: web3.utils.toHex(txCount),
            to: this.contractAddress,
            data: encodedABI,
            gasLimit: web3.utils.toHex(3000000),
            gasPrice: web3.utils.toHex(web3.utils.toWei('40','gwei')),
            chainId:3
        }
        const tx = new Tx(ob, {chain:'ropsten', hardfork: 'petersburg'});
        tx.sign(private_Key_1);
        const serializedTransaction =tx.serialize();
        const raw ='0x'+serializedTransaction.toString('hex');

        return await web3.eth.sendSignedTransaction(raw, async (err,txHash) => {
            if (err) return 1;
        });
    //    this.res = JSON.stringify(this.res);
    //    console.log(this.res);
    }
    catch(error){
        console.log(error);
    }
    
};

add.prototype.addPercent = async function(percent, ml){
    var encodedABI = this.myAbi.methods.addpercent(percent, ml).encodeABI();
    var Tx = require('ethereumjs-tx').Transaction
    var private_Key_1 = new Buffer.from(this.privateKey,'hex')
    this.res;
    var txCount = await web3.eth.getTransactionCount(this.address); 
    try {
        const ob ={
            from: this.address,
            nonce: web3.utils.toHex(txCount),
            to: this.contractAddress,
            data: encodedABI,
            gasLimit: web3.utils.toHex(3000000),
            gasPrice: web3.utils.toHex(web3.utils.toWei('40','gwei')),
            chainId:3
        }
        const tx = new Tx(ob, {chain:'ropsten', hardfork: 'petersburg'});
        tx.sign(private_Key_1);
        const serializedTransaction =tx.serialize();
        const raw ='0x'+serializedTransaction.toString('hex');

        return await web3.eth.sendSignedTransaction(raw, async (err,txHash) => {
            if (err) return 1;
        });
    //    this.res = JSON.stringify(this.res);
    //    console.log(this.res);
    }
    catch(error){
        console.log(error);
    }
    
};

add.prototype.acceptREQ = async function(dicision, idGrade, classH){
    var encodedABI = this.myAbi.methods.acceptREQ(dicision, idGrade, classH).encodeABI();
    var Tx = require('ethereumjs-tx').Transaction;
    var private_Key_1 = new Buffer.from(this.privateKey,'hex');
    this.res;
    var txCount = await web3.eth.getTransactionCount(this.address); 
    try {
        const ob ={
            from: this.address,
            nonce: web3.utils.toHex(txCount),
            to: this.contractAddress,
            data: encodedABI,
            gasLimit: web3.utils.toHex(3000000),
            gasPrice: web3.utils.toHex(web3.utils.toWei('40','gwei')),
            chainId:3
        }
        const tx = new Tx(ob, {chain:'ropsten', hardfork: 'petersburg'});
        tx.sign(private_Key_1);
        const serializedTransaction =tx.serialize();
        const raw ='0x'+serializedTransaction.toString('hex');

        return await web3.eth.sendSignedTransaction(raw, async (err,txHash) => {
            if (err) return 1;
        });
    //    this.res = JSON.stringify(this.res);
    //    console.log(this.res);
    }
    catch(error){
        console.log(error);
    }

};

//var Add = new add(address,privateKey);
//Add.addgr("lop1", ["3","3","3","3","3"], 1);

module.exports = add;