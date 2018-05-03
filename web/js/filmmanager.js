$(function(){
    $('.pl-table').tooltip({
      selector: "a[data-toggle=tooltip]"
    })

    $('.pl-select-category a').click(function () {
        var strId = '#'+$(this).attr('data-target');
        $(strId).val($(strId).val()+"_"+$(this).attr('data-name'));
        strId+="Id";
        $(strId).val($(strId).val()+"_"+$(this).attr('data-id'));
    })
    $('.pl-model-clear').click(function () {
        var strId = '#'+$(this).attr('data-target');
        $(strId).val("");
        strId+="Id";
        $(strId).val("");
    })

    $('#addFilmBtn').click(function () {
        $('#addFilmForm').submit();
    })
    $('.disabled').click(function () {
        return false;
    })
    $('#addGenre').focus(function(){
        $(this).blur();
    })

    $('.viewBtn').click(function(){
        $('#viewIframe').attr("src",$(this).attr('data-path'));
    })
    $('.editBtn').click(function(){
        $('#editFilmId').val($(this).attr("data-fid"));
        $('#editFilmName').val($(this).attr("data-fname"));
        $('#editFilmDirector').val($(this).attr("data-fdirector"));
        $('#editFilmGenreId').val($(this).attr("data-fgenreid"));
        $('#editFilmGenre').val($(this).attr("data-fgenre"));
        $('#editFilmStars').val($(this).attr("data-fstars"));
        $('#editFilmRegion').val($(this).attr("data-fregion"));
        $('#editFilmLanguage').val($(this).attr("data-flanguage"));
        $('#editFilmLength').val($(this).attr("data-flength"));
        $('#editFilmDate').val($(this).attr("data-fdate"));
        $('#editFilmPic').val($(this).attr("data-fpic"));
        $('#editFilmUrl').val($(this).attr("data-furl"));
        $('#editFilmSummary').val($(this).attr("data-fsummary"));

    })
    $('#editFilmBtn').click(function () {
        $('#editFilmForm').submit();
    })
    $('.deleteBtn').click(function(){
        if(confirm('确定要删除吗？'))
            return true;
        else
            return false;
    })

    $('#addFilmUpload').click(function(){
        $.upload({
            // 上传地址
            url: '/admin/uploadposter',
            // 文件域名字
            fileName: 'filedata',
            // 其他表单数据
            params: {},
            // 上传完成后, 返回json, text
            dataType: 'json',
            // 上传之前回调,return true表示可继续上传
            onSend: function() {
                $('#addFilmPic').attr("placeholder","上传中，稍等。。");
                $('#addFilmSpinner').css("display","inline");
                return true;
            },
            // 上传之后回调
            onComplate: function(data) {
                if(data.success){
                    $('#addFilmPic').attr("placeholder","上传完成");
                    $('#addFilmPic').val(data.filepath);
                }else{
                    $('#addFilmPic').attr("placeholder","上传失败");
                }
                $('#addFilmSpinner').css("display","none");
                alert(data.message);
            }
        });
    })
    $('#editFilmUpload').click(function(){
        $.upload({
            // 上传地址
            url: '/admin/uploadposter',
            // 文件域名字
            fileName: 'filedata',
            // 其他表单数据
            params: {},
            // 上传完成后, 返回json, text
            dataType: 'json',
            // 上传之前回调,return true表示可继续上传
            onSend: function() {
                $('#editFilmPic').attr("placeholder","上传中，稍等。。");
                $('#editFilmSpinner').css("display","inline");
                return true;
            },
            // 上传之后回调
            onComplate: function(data) {
                if(data.success){
                    $('#editFilmPic').attr("placeholder","上传完成");
                    $('#editFilmPic').val(data.filepath);
                }else{
                    $('#editFilmPic').attr("placeholder","上传失败");
                }
                $('#editFilmSpinner').css("display","none");
                alert(data.message);
            }
        });
    })
})