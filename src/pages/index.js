import { Author } from "db/sequelize";
import { useRouter } from "next/router";
import { useEffect } from "react";

export default function Index ({ testAuthors }) {
  // testing next router
  const router = useRouter();
  useEffect(() => {
    router.push('/homepage');
  }, []); 

  // testing sequelize
  const authors = testAuthors.map(author => <li key={author.id}>{author.name}</li>);
  console.log(authors);

  return (
    <>
      <main>
        <ul>
          {authors}
        </ul>
      </main>
    </>
  );
  
}

export async function getStaticProps() {

  let testAuthors = await Author.findAll();

  testAuthors = testAuthors.map(author => author.toJSON())
  
  return {
    props: {
      testAuthors: testAuthors,
    }
  };
}
