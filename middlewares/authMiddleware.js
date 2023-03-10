function checkLogin(req, res, next) {
    if (req.session.user) {
      // session 有資料，表示登入過
      next();
    } else {
      // req.session 沒有 member 這個值 -> 尚未登入
      return res.status(400).json({ msg: '尚未登入' });
    }
  }
  
  module.exports = {
    checkLogin,
  };  