import styles from "./Editor.module.css";

export default function ColorEditor() {
  return (
    <div
      style={{
        background: "hotpink",
        color: "white",
      }}
      className={styles.editor}
    >
      ColorEditor
    </div>
  );
}
