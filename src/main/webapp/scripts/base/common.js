//格式化日期
function _formatDatetime(datetime) {
	if (datetime === null) {
		return '';
	}
	datetime = new Date(datetime);
	return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1))
			+ '-' + _fillZero(datetime.getDate()) + ' '
			+ _fillZero(datetime.getHours()) + ':'
			+ _fillZero(datetime.getMinutes()) + ':'
			+ _fillZero(datetime.getSeconds());
}

//补零
function _fillZero(data) {
	if (data < 10) {
		return "0" + data;
	}
	return data;
}

