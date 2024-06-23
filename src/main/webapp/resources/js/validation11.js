/**
 * 
 */

 function CheckAddBook(){
	var estateId = document.getElementById("estateId");
	var owner = document.getElementById("owner");
	var price = document.getElementById("owner");
	var price = document.getElementById("price");
	
	var description = document.getElementById("description");
	
	//도서아이디 체크
	if (!check(/^ISBN[0-9]{4,11}$/, estateId, "[건물 크드]\nISBN과 숫자를 조합하여 5~12 자까지 입력하세요\n첫 글자는 반드시 ISBN로 시작하세요"))
		return false;
		
		
	//도서명 체크
	/*
	if(owner.value.length < 4 || owner.value.length > 50){
		alert("[주인 이름]\n최소 4자에서 최대 50자까지 입력하세요");
		owner.focus();
		return false;
	}
	*/
	if (price.value.length == 0 || isNaN(price.value)){
		alert("[가격]\n숫자만 입력하세요");
		price.focus();
		return false;
	}
	
	if(price.value < 0){
		alert("[가격]\n음수를 입력할 수 없습니다");
		price.focus();
		return fasle;
		
	}
	
	
	if (description.value.length < 100 ){
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
		
	document.newBuilding.submit();
	
		
 }
 
 
 function Initial(){
   
        	var selection = document.getElementById("noOfImg");
            var targetDiv = document.getElementById("noOfInput");
        selection.addEventListener('change', function() {
        	var num = parseInt(this.value);
        	
        	
	      if (num>0) {
	    	  
	    	  
	    		  for(let i=0; i<4-num; i++){
					      	
			      	 targetDiv.removeChild(targetDiv.lastChild);
				  }
	    		  		    		  
			      
		        
	    	  
	      } else {
	    	 
	        targetDiv.innerHTML = '';
	      }
	     
    });
    
    
    
    function previewImages() {
    var preview = document.querySelector('.image-preview');
    preview.innerHTML = '';

    // Loop through all file input fields
    var fileInputs = document.querySelectorAll('input[type="file"]');
    fileInputs.forEach(function(input) {
        if (input.files) {
            [].forEach.call(input.files, function(file) {
                readAndPreview(file);
            });
        }
    });

    function readAndPreview(file) {
        // Make sure `file.name` matches our extensions criteria
        if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
            return alert(file.name + " is not an image");
        }

        var reader = new FileReader();

        reader.addEventListener("load", function() {
            var image = new Image();
            image.src = this.result;
            preview.appendChild(image);
        });

        reader.readAsDataURL(file);
    }
}

// Add event listeners to all file input fields
var fileInputs = document.querySelectorAll('input[type="file"]');
fileInputs.forEach(function(input) {
    input.addEventListener("change", previewImages);
});
    
    
    
 }
 
 
 
 
 
 
 
 