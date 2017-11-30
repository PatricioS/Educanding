function validarCheckbox(obj,type,fun){  
    if(obj.addEventListener){  
        obj.addEventListener(type,fun,false);  
    }else if(obj.attachEvent){  
        var f=function(){  
            fun.call(obj,window.event);  
        }  
        obj.attachEvent('on'+type,f);  
        obj[fun.toString()+type]=f;  
    }else{  
        obj['on'+type]=fun;  
    }  
}
window.onload = function(){
    var foo = document.getElementsByName('tags[]');
    for(var i = 0; i < tags.length; i++){
        addEvent(tags[i], 'click', function(){
            if(this.checked){
                alert(this.value);
            }
        });
    }
}