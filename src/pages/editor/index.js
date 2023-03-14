import { withSessionSsr } from "@/session/withSession";
import { seedDb } from "@/lib/getBackgrounds";
import { BgImage, User } from "db/sequelize";
import QuoteEditor from "@/components/QuoteEditor/QuoteEditor";

export default function (props) {
  // console.log("Editor page client side:", backgrounds);
  return (
    <QuoteEditor
      userId={props.userId}
      backgrounds={props.backgrounds ? props.backgrounds : []}
    />
  );
}

export const getServerSideProps = withSessionSsr(
  async function getServerSideProps({ req, res }) {
    const sessionUser = req.session.user;
    try {
      const user = await User.findByPk(sessionUser.id);
      if (!user) {
        throw new Error("User not found.");
      }
      const userId = user.id;

      let backgrounds = await BgImage.findAll();
      // do we need to seed the database?
      if (backgrounds.length === 0) {
        await seedDb();
        backgrounds = await BgImage.findAll();
      }
      // make data understandable by to the front end
      backgrounds = backgrounds.map((background) => background.toJSON());

      return {
        props: {
          backgrounds,
          userId,
        },
      };
    } catch (error) {
      console.log(error);
      return {
        props: {
          error: "An error occurred serverside.",
        },
      };
    }
  }
);
