import { withSessionSsr } from "@/session/withSession";
import { User } from "db/sequelize";
import { parseDate } from "../lib/dateHelper";
import Diary from "../components/Diary/Diary";

export default function ({ entries, tasks }) {
  return <Diary diaryNotes={entries} userTasks={tasks} />;
};

export const getServerSideProps = withSessionSsr(
  async function getServerSideProps({ req }) {
    const sessionUser = req.session.user;

    const user = await User.findByPk(sessionUser.id);

    const rawOption = { raw: true };
    const entries = await user.getDiaryEntries(rawOption);
    const tasks = await user.getTasks(rawOption);

    return {
      props: { entries: parseDate(entries), tasks },
    };
  }
);
