import { DiaryEntry, Task, User } from "db/sequelize";
import Diary from "../components/Diary/Diary"


export default function(userDiaryEntries, userTasks) {
  return <Diary diaryNotes={userDiaryEntries} userTasks={userTasks}/>;
}

export async function getStaticProps() {

  const userDiaryEntriesData = await DiaryEntry.findAll({ where: {userId: 1 }});        /*object Date cannot be serialized as JSON*/
  const userDiaryEntries = userDiaryEntriesData.map(diaryEntry => diaryEntry.toJSON());

  const userTasksData = await User.findAll({
    where:{id: '5'},
    include: [{model: Task}]
  });
  const userTasks = userTasksData.map(task => task.toJSON());


  return {
    props: {
      userDiaryEntries: userDiaryEntries,
      userTasks: userTasks
    }
  };
}

