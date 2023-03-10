import styles from "./Editor.module.css";

export default function ImageEditor({ backgrounds }) {
  const basePath = "backgrounds/";
  return (
    <div
      style={{
        background: "hotpink",
        color: "white",
      }}
      className={styles.editor}
    >
      <ul className={styles.imageList}>
        {backgrounds.map((background) => (
          <li key={background.id}>
            <img
              src={`${basePath}${background.path}`}
              alt={background.path}
              className={styles.imagePreview}
            />
          </li>
        ))}
      </ul>
    </div>
  );
}
