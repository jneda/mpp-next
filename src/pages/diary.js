import { withSessionSsr } from "@/session/withSession";
import { User } from "db/sequelize";
import { parseDate } from "../lib/dateHelper";
import Diary from "../components/Diary/Diary";

export default function ({ entries, tasks, id }) {
  return <Diary diaryNotes={entries} userTasks={tasks} userId={id} />;
};

export const getServerSideProps = withSessionSsr(
  async function getServerSideProps({ req }) {
    const sessionUser = req.session.user;

    const user = await User.findByPk(sessionUser.id);

    const rawOption = { raw: true };
    const entries = await user.getDiaryEntries({rawOption, order:[['date', 'DESC']]});
    const tasks = await user.getTasks(rawOption);
    const id = user.id;

    return {
      props: { entries: parseDate(entries), tasks, id },
    };
  }
);
