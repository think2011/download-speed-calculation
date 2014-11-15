(function() {
  (function() {
    var $result, $size, $speed, count, showCount, testSpeed;
    $size = document.querySelector('#size');
    $speed = document.querySelector('#speed');
    $result = document.querySelector('#result');
    count = function(size, speed) {
      var i, result, sec, v;
      sec = +size * 1024 * 1024 / +speed;
      result = {
        h: [sec / 60 / 60, '小时'],
        m: [sec / 60, '分钟'],
        s: [sec, '秒'],
        desc: null
      };
      for (i in result) {
        v = result[i];
        switch (i) {
          case 'h':
            result.desc = v;
            break;
          case 'm':
            if (v[0] <= 60) {
              result.desc = v;
            }
            break;
          case 's':
            if (v[0] <= 60) {
              result.desc = v;
            }
        }
        v[0] = +(v[0].toFixed(2));
      }
      return result;
    };
    showCount = function() {
      var result, sizeVal, speedVal;
      sizeVal = $size.value;
      speedVal = $speed.value;
      if (sizeVal && speedVal) {
        result = count(sizeVal, speedVal);
        return $result.innerText = "大概需时：" + result.desc[0] + result.desc[1];
      } else {
        return $result.innerText = '等待计算..';
      }
    };
    $size.addEventListener('keyup', showCount, false);
    $speed.addEventListener('keyup', showCount, false);
    testSpeed = function() {
      var img, startTime;
      startTime = new Date();
      img = new Image();
      img.src = "http://su.bdimg.com/static/superplus/img/logo_white_ee663702.png?" + (Date.now());
      return img.onload = function() {
        var endTime, resultTime, size;
        size = 14 * 1024;
        endTime = new Date();
        return resultTime = endTime - startTime;
      };
    };
    return testSpeed();
  })();

}).call(this);

//# sourceMappingURL=index.js.map