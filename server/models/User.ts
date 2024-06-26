import BaseModel from "../base/BaseModel";
import { DataTypes, Sequelize, ModelAttributes, ModelOptions } from "sequelize";
import sequelize from "../db";

export default class User extends BaseModel<User> {
  declare username: string;
  declare password: string;
  declare avatar: string;
  declare gender: UserGenderEnum;
  declare email: string;
  declare introduction: string;
  declare superAdmin: number;
  declare status: number;

  public authorityList?: string[];
  public roleIdList?: number[];

  static initUser(sequelize: Sequelize): typeof User {
    const modelAttributes: ModelAttributes = {
      username: {
        type: DataTypes.STRING({ length: 20 }),
        allowNull: false,
        comment: "姓名/昵称",
      },
      password: {
        type: DataTypes.STRING({ length: 255 }),
        allowNull: false,
        comment: "密码",
      },
      avatar: {
        type: DataTypes.STRING({ length: 255 }),
        allowNull: true,
        comment: "头像",
      },
      gender: {
        type: DataTypes.ENUM({ values: ["men", "women", "secret"] }),
        allowNull: true,
        comment: "性别",
      },
      email: {
        type: DataTypes.STRING({ length: 20 }),
        allowNull: true,
        comment: "邮箱",
      },
      introduction: {
        type: DataTypes.TEXT({ length: 'long' }),
        allowNull: true,
        comment: "简介",
      },
      superAdmin: {
        type: DataTypes.INTEGER({ length: 1 }),
        allowNull: false,
        defaultValue: 0,
        comment: "是否是超级管理员(0:否 1:是)"
      },
      status: {
        type: DataTypes.INTEGER({ length: 1 }),
        allowNull: false,
        defaultValue: 0,
        comment: "是否正常(0:正常 1:停用)"
      }
    };

    const modelOptions: ModelOptions & { sequelize: Sequelize } = {
      sequelize,
      tableName: 'user',
    };

    const userModel = super.initModel(modelAttributes, modelOptions) as typeof User;
    return userModel;
  }
}

// 初始化模型，调用 initUser 方法
export const userModel = User.initUser(sequelize);