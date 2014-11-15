do ->
  $size       = document.querySelector '#size'
  $speed      = document.querySelector '#speed'
  $result     = document.querySelector '#result'


  # 下载时间计算
  #
  count = (size, speed) ->
    sec    = +size * 1024 * 1024 / +speed
    result =
      h   : [sec / 60 / 60, '小时']
      m   : [sec/ 60, '分钟']
      s   : [sec, '秒']
      desc: null

    for i, v of result
      # 保存最适合显示的值
      switch i
        when 'h'
          result.desc = v
        when 'm'
          if v[0] <= 60 then result.desc = v
        when 's'
          if v[0] <= 60 then result.desc = v

      v[0] = +(v[0].toFixed(2))

    return result


  # 显示结果
  #
  showCount = ->
    sizeVal  = $size.value
    speedVal = $speed.value

    if sizeVal and speedVal
      result = count sizeVal, speedVal
      $result.innerText = "大概需时：#{result.desc[0]}#{result.desc[1]}"
    else
      $result.innerText = '等待计算..'


  $size.addEventListener 'keyup', showCount, false
  $speed.addEventListener 'keyup', showCount, false



  testSpeed = ->
    startTime = new Date()
    img = new Image()
    img.src = "http://su.bdimg.com/static/superplus/img/logo_white_ee663702.png?#{Date.now()}"

    img.onload = ->
      size    = 14 * 1024
      endTime = new Date()
      resultTime = endTime - startTime




  testSpeed()

