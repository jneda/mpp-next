import { DiaryEntry, Task, User } from "db/sequelize";
import Diary from "../components/Diary/Diary";

export default function (userDiaryEntries, userTasks) {
  return <Diary diaryNotes={userDiaryEntries} userTasks={userTasks} />;
}

export async function getStaticProps() {
  const userDiaryEntriesData = await DiaryEntry.findAll({
    where: { userId: "5" },
  }); /*object Date cannot be serialized as JSON*/
  // console.log(userDiaryEntriesData);
  const userDiaryEntries = userDiaryEntriesData.map((diaryEntry) => {
    console.log(diaryEntry);
    return diaryEntry.toJSON();
  });

  const userTasksData = await User.findAll({
    where: { id: "5" },
    include: [{ model: Task }],
  });
  const userTasks = userTasksData.map((task) => task.toJSON());

  return {
    props: {
      userDiaryEntries: userDiaryEntries,
      userTasks: userTasks,
    },
  };
}
