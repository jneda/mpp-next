const { Sequelize, DataTypes } = require("sequelize");
const QuoteSourceModel = require("./models/quoteSource");
const QuoteCategoryModel = require("./models/quoteCategory");
const AuthorModel = require("./models/author");
const QuoteViewModel = require("./models/quoteView");
const UserModel = require("./models/user");
const RoleModel = require("./models/role");
const MoodModel = require("./models/mood");
const QuoteListModel = require("./models/quoteList");
const DiaryEntryModel = require("./models/diaryEntry");
const TaskModel = require("./models/task");
const TaskCategoryModel = require("./models/taskCategory");
const QuoteViewStyleModel = require("./models/quoteViewStyle");
const UserStyleModel = require("./models/userStyle");
const BgImageModel = require("./models/bgImage");
const ColorModel = require("./models/color");
const FontModel = require("./models/font");

const sequelize = new Sequelize("mypeacefulplace", "root", "", {
  host: "localhost",
  dialect: "mysql",
  logging: false,
});

sequelize
  .authenticate()
  .then((result) => console.log("Connexion réussie "))
  .catch((err) => console.error(`Echec: ${err}`));

const QuoteSource = QuoteSourceModel(sequelize, DataTypes);
const QuoteCategory = QuoteCategoryModel(sequelize, DataTypes);
const Author = AuthorModel(sequelize, DataTypes);
const QuoteView = QuoteViewModel(sequelize, DataTypes);
const User = UserModel(sequelize, DataTypes);
const Role = RoleModel(sequelize, DataTypes);
const Mood = MoodModel(sequelize, DataTypes);
const QuoteList = QuoteListModel(sequelize, DataTypes);
const DiaryEntry = DiaryEntryModel(sequelize, DataTypes);
const Task = TaskModel(sequelize, DataTypes);
const TaskCategory = TaskCategoryModel(sequelize, DataTypes);
const QuoteViewStyle = QuoteViewStyleModel(sequelize, DataTypes);
const UserStyle = UserStyleModel(sequelize, DataTypes);
const BgImage = BgImageModel(sequelize, DataTypes);
const Color = ColorModel(sequelize, DataTypes);
const Font = FontModel(sequelize, DataTypes);

QuoteSource.belongsToMany(QuoteCategory, {
  through: "QuoteSourceQuoteCategories",
  timestamps: false,
});
QuoteCategory.belongsToMany(QuoteSource, {
  through: "QuoteSourceQuoteCategories",
  timestamps: false,
});
Author.hasMany(QuoteSource);
QuoteSource.belongsTo(Author);
QuoteView.belongsTo(QuoteSource);
QuoteSource.hasMany(QuoteView);
User.belongsTo(Role);
Role.hasMany(User);
Mood.belongsToMany(User, {
  through: "UserMoods",
  timestamps: true,
  createdAt: "date",
  updatedAt: false,
}); // <-- modifier humeur de la journée ?
User.belongsToMany(Mood, {
  through: "UserMoods",
  timestamps: true,
  createdAt: "date",
  updatedAt: false,
});
QuoteSource.belongsTo(User);
User.hasMany(QuoteSource);
QuoteList.belongsToMany(QuoteView, {
  through: "QuoteListQuoteViews",
  timestamps: false,
});
QuoteView.belongsToMany(QuoteList, {
  through: "QuoteListQuoteViews",
  timestamps: false,
});
QuoteList.belongsToMany(User, {
  through: "UserQuoteLists",
  timestamps: false,
});
User.belongsToMany(QuoteList, {
  through: "UserQuoteLists",
  timestamps: false,
});
User.hasMany(DiaryEntry);
DiaryEntry.belongsTo(User);
Task.belongsTo(TaskCategory);
TaskCategory.hasMany(Task);

const UserTasks = sequelize.define(
  "userTasks",
  {
    userId: {
      type: DataTypes.INTEGER,
      references: {
        model: User,
        key: "id",
      },
      allowNull: false,
    },
    taskId: {
      type: DataTypes.INTEGER,
      references: {
        model: Task,
        key: "id",
      },
      allowNull: false,
    },
    checked: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  { timestamps: false }
);

Task.belongsToMany(User, { through: UserTasks });
User.belongsToMany(Task, { through: UserTasks });

UserStyle.hasMany(User);
User.belongsTo(UserStyle);
UserStyle.belongsTo(BgImage);
UserStyle.belongsTo(Color, {
  foreignKey: "fgColorId",
});
BgImage.hasMany(UserStyle);
Color.hasMany(UserStyle, {
  foreignKey: "fgColorId",
});

QuoteViewStyle.hasMany(QuoteView);
QuoteView.belongsTo(QuoteViewStyle);

QuoteViewStyle.belongsTo(BgImage);
BgImage.hasMany(QuoteViewStyle);

QuoteViewStyle.belongsTo(Font, {
  foreignKey: "contentFontId",
});
Font.hasMany(QuoteViewStyle, {
  foreignKey: "contentFontId",
});

QuoteViewStyle.belongsTo(Color, {
  foreignKey: "contentColorId",
});
Color.hasMany(QuoteViewStyle, {
  foreignKey: "contentColorId",
});

QuoteViewStyle.belongsTo(Font, {
  foreignKey: "authorFontId",
});
Font.hasMany(QuoteViewStyle, {
  foreignKey: "authorFontId",
});

QuoteViewStyle.belongsTo(Color, {
  foreignKey: "authorColorId",
});
Color.hasMany(QuoteViewStyle, {
  foreignKey: "authorColorId",
});

QuoteList.belongsTo(User);
User.hasMany(QuoteList);
QuoteView.belongsTo(User);
User.hasMany(QuoteView);
QuoteViewStyle.belongsTo(User);
User.hasMany(QuoteViewStyle);


UserStyle.belongsTo(Color, {
  foreignKey: "bgColorId",
});
Color.hasMany(UserStyle, {
  foreignKey: "bgColorId",
});

function initDb() {
  return sequelize.sync({ alter: true })
  .then(_ => console.log('syncho réussi'));
  // return sequelize.sync();
}

// initDb()

module.exports = {
  sequelize,
  Author,
  BgImage,
  Color,
  DiaryEntry,
  Font,
  Mood,
  QuoteCategory,
  QuoteList,
  QuoteSource,
  QuoteView,
  QuoteViewStyle,
  Role,
  Task,
  TaskCategory,
  User,
  UserStyle,
  UserTasks,
};
