import BaseModel from "../base/BaseModel";
import { DataTypes, Sequelize } from "sequelize";
import sequelize from "../db";

export default class Attachment extends BaseModel<Attachment> {
    declare title: string;
    declare url: string;
    declare ext: string;
    declare size: number;

    static initAttachment(sequelize: Sequelize): typeof Attachment {
        const modelAttributes = {
            title: {
                type: DataTypes.STRING,
                allowNull: false,
                comment: "附件标题",
            },
            url: {
                type: DataTypes.STRING,
                allowNull: false,
                comment: '附件链接',
            },
            ext: {
                type: DataTypes.STRING,
                allowNull: false,
                comment: '附件分类/扩展名',
            },
            size: {
                type: DataTypes.INTEGER,
                allowNull: false,
                comment: '附件大小',
            },
        };

        const modelOptions = {
            sequelize,
            tableName: 'attachment',
        };

        return super.initModel(modelAttributes, modelOptions) as typeof Attachment;
    }
}

// 初始化模型，调用 initAttachment 方法
export const attachmentModel = Attachment.initAttachment(sequelize) as typeof Attachment;