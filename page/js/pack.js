var util = {
    addZero: function (m) {
        return m < 10 ? '0' + m : m;
    }
};
var pack = {
    http: function (type, url, params, callback) {
        var data = params;
        var contentType = 'application/x-www-form-urlencoded';
        if (type === 'POST' || type === 'PUT') {
            data = JSON.stringify(data);
            contentType = "application/json";
        }
        $.ajax({
            type,
            url,
            data,
            dataType: 'json',
            contentType,
            async: false,
            success: function (result) {
                if (result && result.success && callback) callback(result, "success");
                else console.log("请求失败：" + result);
            },
            error: function (result, textStatus) {
                swal({
                    title: "错误提示",
                    text: result.responseJSON.message
                });
            }
        });
    },
    getQueryString: function (name) {
        let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        let r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        };
        return null;
    },
    dateToString: function (time) {
        var year = time.getFullYear(),
            month = time.getMonth() + 1,  //月份是从0开始的
            day = time.getDate(),
            hour = time.getHours(),
            minute = time.getMinutes(),
            second = time.getSeconds()
        return year + '-' + util.add0(month) + '-' + util.add0(day) + '' + util.add0(hour) + ':' + util.add0(minute) + ':' + util.add0(second);
    }
};