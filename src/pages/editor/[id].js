import { withSessionSsr } from "@/session/withSession";
import {
  Author,
  BgImage,
  Color,
  Font,
  QuoteSource,
  QuoteView,
  QuoteViewStyle,
  User,
} from "db/sequelize";
import QuoteEditor from "@/components/QuoteEditor/QuoteEditor";

export default function DynamicEditor(props) {
  return <QuoteEditor props={props} />;
}

export const getServerSideProps = withSessionSsr(
  async function getServerSideProps({ req, params }) {
    try {
      const quoteViewId = params.id;

      const { quoteView, viewStyle, quote } = await getEditorProps(quoteViewId);

      const sessionUser = req.session.user;
      const user = await User.findByPk(sessionUser.id);
      if (!user) {
        throw new Error("User not found.");
      }
      const userId = user.id;

      return {
        props: {
          userId,
          quoteView,
          viewStyle,
          quote,
          random: false,
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

async function getEditorProps(quoteViewId) {
  try {
    const quoteView = await QuoteView.findByPk(quoteViewId, {
      attributes: ["id", "userId"],
      include: [
        {
          model: QuoteViewStyle,
          attributes: ["id", "userId", "authorFontSize", "contentFontSize"],
          include: [
            { model: BgImage, attributes: ["imagePath"] },
            { model: Font, as: "contentFont", attributes: ["fontPath"] },
            { model: Font, as: "authorFont", attributes: ["fontPath"] },
            { model: Color, as: "contentColor", attributes: ["color"] },
            { model: Color, as: "authorColor", attributes: ["color"] },
          ],
        },
        {
          model: QuoteSource,
          attributes: ["id", "content"],
          include: [{ model: Author, attributes: ["name"] }],
        },
      ],
    });

    if (quoteView == null) {
      throw new Error("QuoteView not found.");
    }

    // console.log(`INFO quoteView: ${JSON.stringify(quoteView, null, 1)}`);

    let { quoteViewStyle, quoteSource } = quoteView;

    const viewStyle = {
      id: quoteViewStyle.id,
      userId: quoteViewStyle.userId,
      bgImage: quoteViewStyle.bgImage.imagePath,
      contentFontSize: quoteViewStyle.contentFontSize,
      authorFontSize: quoteViewStyle.authorFontSize,
      contentFont: quoteViewStyle.contentFont.fontPath,
      authorFont: quoteViewStyle.authorFont.fontPath,
      contentColor: quoteViewStyle.contentColor.color,
      authorColor: quoteViewStyle.authorColor.color,
    };

    // console.log(`INFO ViewStyle: ${JSON.stringify(viewStyle, null, 1)}`);

    const quote = {
      id: quoteSource.id,
      content: quoteSource.content,
      author: quoteSource.author.name,
    };

    // console.log(`INFO quoteSource: ${JSON.stringify(quote, null, 1)}`);

    return {
      quoteView: {
        id: quoteView.id,
        userId: quoteView.userId,
      },
      viewStyle,
      quote,
    };
  } catch (error) {}
}
