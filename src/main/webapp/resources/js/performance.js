$(function(){
	//공연시작일
	$("#pickStartDate").datepicker(
		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토'],
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showOtherMonths : true,
			selectOtherMonths : true,
			showMonthAfterYear : true,
			yearSuffix : '년',
			minDate : 0 //최소날짜 : 오늘
		});
	
	
	//공연종료일
	$("#pickEndDate").datepicker($.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토'],
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showOtherMonths : true,
			selectOtherMonths : true,
			showMonthAfterYear : true,
			yearSuffix : '년',
			minDate : 0 //최소날짜 : 오늘
		});
	
	
	//공연시간선택
	$('#timepicker').mdtimepicker({
		format: 'hh:mm',
		theme: 'teal'
	});
	
	//시간 초기화 버튼
	$("#btnReset").click(function(){
		$("#timepicker").val("");
	})
	

	//공연종류
	$('.select').on('click', '.placeholder', function() {
		var parent = $(this).closest('.select');
		if (!parent.hasClass('is-open')) {
			parent.addClass('is-open');
			$('.select.is-open').not(parent).removeClass('is-open');
		} else {
			parent.removeClass('is-open');
		}
	}).on('click', 'ul>li', function() {
		var parent = $(this).closest('.select');
		parent.removeClass('is-open').find('.placeholder').text($(this).text());
		parent.find('input[type=hidden]').attr('value', $(this).attr('data-value'));
	});
	
	
	//이미지 업로드
	$(document).on('click', '#close-preview', function(){ 
	    $('.image-preview').popover('hide');
	    // Hover befor close the preview
	    $('.image-preview').hover(
	        function () {
	           $('.image-preview').popover('show');
	        }, 
	         function () {
	           $('.image-preview').popover('hide');
	        }
	    );    
	});
	
	// Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>미리보기</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("변경");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });  
	
	
});
	
	

