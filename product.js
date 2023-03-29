app.get('/product', async (req, res, next) => {
    const page = req.query.page || 1
  
    let sql = `
      FROM product
      JOIN product_category ON product.category_id = product_category.id
      JOIN product_spec ON product.spec_id = product_spec.id
      LEFT JOIN user_like ON product.id = user_like.product_id
      LEFT JOIN product_color_detail ON product.id = product_color_detail.product_id
      LEFT JOIN product_color ON product_color.id = product_color_detail.color_id `
  
    //有送名稱搜尋給後端就過濾名稱
    if (!isEmpty(req.query.product_name)) {
      // 判斷有沒有 WHERE，沒有的話要加上 WHERE，否則加上 AND
      if (sql.indexOf('WHERE') === -1) {
        sql += 'WHERE '
      } else {
        sql += 'AND '
      }
  
      sql += `product.product_name LIKE '%${req.query.product_name}%' `
    }
  
    //有送分類給後端就過濾分類
    if (!isEmpty(req.query.category_name)) {
      // 判斷有沒有 WHERE，沒有的話要加上 WHERE，否則加上 AND
      if (sql.indexOf('WHERE') === -1) {
        sql += 'WHERE '
      } else {
        sql += 'AND '
      }
  
      sql += `product_category.category_name = '${req.query.category_name}' `
    }
  
    //有送規格給後端就過濾規格
    if (!isEmpty(req.query.spec_name)) {
      // 判斷有沒有 WHERE，沒有的話要加上 WHERE，否則加上 AND
      if (sql.indexOf('WHERE') === -1) {
        sql += 'WHERE '
      } else {
        sql += 'AND '
      }
  
      sql += `product_spec.spec_name = '${req.query.spec_name}' `
    }
  
    // 有送顏色給後端就過濾顏色
    if (!isEmpty(req.query.color_name)) {
      // 判斷有沒有 WHERE，沒有的話要加上 WHERE，否則加上 AND
      if (sql.indexOf('WHERE') === -1) {
        sql += 'WHERE '
      } else {
        sql += 'AND '
      }
  
      sql += `product_color.color_name = '${req.query.color_name}' `
    }
  
    // 有送價格給後端就過濾價格
    if (
      !isEmpty(req.query.product_price_start) &&
      !isEmpty(req.query.product_price_end)
    ) {
      // 判斷有沒有 WHERE，沒有的話要加上 WHERE，否則加上 AND
      if (sql.indexOf('WHERE') === -1) {
        sql += 'WHERE '
      } else {
        sql += 'AND '
      }
  
      sql += `
        product.product_price >= '${req.query.product_price_start}' AND 
        product.product_price <= '${req.query.product_price_end}'
      `
    }
  
    // 頁碼
    let [results] = await pool.query(
      `SELECT COUNT(DISTINCT product.id) AS total ${sql}`
    )
    const total = results[0].total
  
    const perPage = 16
    const totalPage = Math.ceil(total / perPage)
  
    const limit = perPage
    const offset = perPage * (page - 1)
    const nextPage = parseInt(page) + 1
    const prevPage = page - 1
  
    sql += `
      GROUP BY product.id
      ORDER BY product.create_time DESC
    `
    // 資料
    let [data] = await pool.query(
      `SELECT
        product.*,
        product_category.category_name,
        product_spec.spec_name,
        GROUP_CONCAT(color_name separator ',') AS color_name
      ${sql}
      LIMIT ? OFFSET ?`,
      [limit, offset]
    )
    return res.json({
      pagination: {
        total,
        perPage,
        totalPage,
        page,
        nextPage,
        prevPage,
      },
      data,
    })
    next()
  })
  
  app.get('/product/:productId', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT product.*,  product_category.category_name, product_spec.spec_name FROM product JOIN product_category ON product.category_id=product_category.id JOIN  product_spec ON product.spec_id=product_spec.id WHERE product.id=?',
      [req.params.productId]
    )
    res.json(data)
    next()
  })
  
  app.get(
    '/product/product_category/:categoryId/productdetail/:productId',
    async (req, res, next) => {
      console.log(
        '/product/product_category/:categoryId/productdetail/:productId => ',
        req.params.productId,
        req.params.categoryId
      )
      let [data] = await pool.query(
        'SELECT product.*,  product_category.category_name, product_spec.spec_name FROM product JOIN product_category ON product.category_id=product_category.id JOIN  product_spec ON product.spec_id=product_spec.id WHERE product.id=? AND category_id=?',
        [req.params.productId, req.params.categoryId]
      )
      res.json(data)
      next()
    }
  )
  
  //隨機取20個商品
  app.get('/randproduct', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT * FROM product ORDER BY RAND() LIMIT 20'
    )
    res.json(data)
    next()
  })
  
  //product_category(分類篩選)
  app.get('/product/product_category/:categoryId', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT product.*,  product_category.category_name, product_spec.spec_name FROM product JOIN product_category ON product.category_id=product_category.id JOIN  product_spec ON product.spec_id=product_spec.id WHERE category_id=?',
      [req.params.categoryId]
    )
    res.json(data)
    next()
  })
  
  //product_img
  app.get('/product_img', async (req, res, next) => {
    let [data] = await pool.query('SELECT * FROM product_img')
    res.json(data)
    next()
  })
  
  app.get('/product/product_img/:productId', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT * FROM product_img WHERE product_id=?',
      [req.params.productId]
    )
    res.json(data)
    next()
  })
  
  //product_color
  app.get('/product_color', async (req, res, next) => {
    let [data] = await pool.query('SELECT * FROM product_color')
    res.json(data)
    next()
  })
  
  app.get('/product/product_color/:colorId', async (req, res, next) => {
    let [data] = await pool.query('SELECT * FROM product_color  WHERE id=?', [
      req.params.colorId,
    ])
    res.json(data)
    next()
  })
  
  //product_color_detail
  app.get('/product_color_detail', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT product_color_detail.*, product_color.color_name, product_color.rgb FROM product_color_detail JOIN product_color ON product_color_detail.color_id=product_color.id JOIN product ON product_color_detail.product_id=product.id'
    )
    res.json(data)
    next()
  })
  
  //針對產品有甚麼顏色(加入購物車時產品挑顏色)
  app.get('/product/product_color_detail/:productId', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT product_color_detail.*, product_color.color_name, product_color.rgb FROM product_color_detail JOIN product_color ON product_color_detail.color_id=product_color.id JOIN product ON product_color_detail.product_id=product.id WHERE product.id=?',
      [req.params.productId]
    )
    res.json(data)
    next()
  })
  
  //針對顏色有甚麼產品(顏色搜尋產品)
  app.get('/product/product_color_detail/color/', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT product_color_detail.*, product_color.color_name, product_color.rgb FROM product_color_detail JOIN product_color ON product_color_detail.color_id=product_color.id JOIN product ON product_color_detail.product_id=product.id'
    )
    res.json(data)
    next()
  })
  
  //product_spec
  app.get('/product_spec', async (req, res, next) => {
    let [data] = await pool.query('SELECT * FROM product_spec')
    res.json(data)
    next()
  })
  
  app.get('/product_spec/:specId', async (req, res, next) => {
    let [data] = await pool.query('SELECT * FROM product_spec WHERE id=?', [
      req.params.specId,
    ])
    res.json(data)
    next()
  })
  
  //product comment
  app.get('/product/:productId/comment', async (req, res, next) => {
    let [data] = await pool.query(
      'SELECT comment.*, user.user_img, user.user_name, order_product.product_id FROM comment JOIN user ON comment.user_id = user.id JOIN order_product ON comment.order_product_id = order_product.id WHERE product_id=? ORDER BY create_time DESC',
      [req.params.productId]
    )
    res.json(data)
    next()
  })

  //產品收藏 ---------------------------------------------------------------
app.get('/users/user_like_get_all', async (req, res, next) => {
    console.log('這裡是 收藏')
    let [data] = await pool.query(
      'SELECT user_like.*, product_category.*, product.product_name, product.product_price, product.subject_img FROM user_like JOIN product ON user_like.product_id = product.id JOIN product_category ON product_category.id = product.category_id'
    )
    res.json(data)
    next()
  })
  
  //產品single
  app.get('/users/user_like_get/:productId', async (req, res, next) => {
    console.log('這裡是 單一產品收藏')
    if (!req.session.user) {
      res.json([])
    } else {
      let [data] = await pool.query(
        'SELECT user_like.*, product_category.category_name, product.product_name, product.product_price, product.subject_img FROM user_like JOIN product ON user_like.product_id = product.id JOIN product_category ON product_category.id = product.category_id WHERE user_id=? AND user_like.product_id=?',
        [req.session.user.id, req.params.productId]
      )
      res.json(data)
      next()
    }
  })
  
  //產品加入收藏
  app.post('/users/user_like_add', async (req, res, next) => {
    // console.log(req.session.user.id, req.body.product_id)
    // 存到資料庫
    if (!req.session.user) {
      res.json([])
    } else {
      let result = await pool.execute(
        'INSERT INTO user_like ( user_id, product_id ) VALUES ( ?,?)',
        [req.session.user.id, req.body.product_id]
      )
  
      console.log('加入收藏', result)
      // 回覆給前端
      res.json({
        msg: '加入收藏',
      })
    }
  })
  
  //產品取消收藏
  app.delete('/users/user_like_delete/:productId', async (req, res, next) => {
    // 存到資料庫
    if (!req.session.user) {
      res.json([])
    } else {
      let result = await pool.execute(
        'DELETE FROM user_like WHERE user_id = ? AND product_id = ?',
        [req.session.user.id, req.params.productId]
      )
  
      // 回覆給前端
      res.json({
        msg: '取消收藏',
      })
    }
  })
  
  