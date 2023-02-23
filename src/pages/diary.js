import { DiaryEntry/*, Task, UserTasks*/ } from "db/sequelize";
import Diary from "../components/Diary/Diary"


export default function(userDiaryEntries) {
  return <Diary diaryNotes={userDiaryEntries}/>;
}

export async function getStaticProps() {

  const userDiaryEntriesData = await DiaryEntry.findAll({ where: {userId: 1 }});
  const userDiaryEntries = userDiaryEntriesData.map(diaryEntry => diaryEntry.toJSON());



  return {
    props: {
      userDiaryEntries: userDiaryEntries
    }
  };
}

