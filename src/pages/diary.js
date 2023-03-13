import { withSessionSsr } from "@/session/withSession";
import { User } from "db/sequelize";
import { parseDate } from "../lib/dateHelper";
import Diary from "../components/Diary/Diary";

export default function ({ entries, tasks, id }) {
  return <Diary diaryNotes={entries} userTasks={tasks} userId={id} />;
}

export const getServerSideProps = withSessionSsr(
  async function getServerSideProps({ req }) {
    const sessionUser = req.session.user;

    const user = await User.findByPk(sessionUser.id);

    const entries = await user.getDiaryEntries({ order: [["date", "DESC"]] });

    let tasks = await user.getTasks();
    tasks = tasks.map((task) => ({
      id: task.id,
      content: task.content,
      checked: task.userTasks.checked,
    }));

    const id = user.id;

    return {
      props: { entries: parseDate(entries), tasks: tasks, id },
    };
  }
);


/*
gestion des erreur route API
style CSS
utilisation des intercalaires
peut être vérifier si tache to do list existe déjà avant créer

*/