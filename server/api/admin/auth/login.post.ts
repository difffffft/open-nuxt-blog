import User from "@/server/models/User";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { secretKey } from "@/server/config";

export default defineWrappedResponseHandler(async (event) => {
  // 账号/密码
  const { username, password } = await readBody(event);

  // 判断数据库是否有该账号，有则取出
  const user = await User.findOne({
    where: {
      username,
    },
  });

  // 没有用户
  if (!user) {
    throw Error("账号或密码错误");
  }

  // 密码校验
  bcrypt.compare(password, user.password, (err, result) => {
    if (err) {
      throw Error("异常");
    } else {
      if (!result) {
        throw Error("账号或密码错误");
      }
    }
  });

  // 用户信息
  const userInfo = {
    id: user.id,
  };

  // 分发Token
  const token = jwt.sign(userInfo, secretKey, {
    expiresIn: "24h",
  });

  return {
    token,
  };
});
