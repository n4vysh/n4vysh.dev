import Image from 'next/image'
import styles from './page.module.css'

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.page}>
        <div className={styles.icon}>
          <Image
            src="/images/icon.svg"
            alt="icon"
            width={75}
            height={75}
            priority
          />
        </div>
        <h1 className={styles.title}>
          <strong>n4vysh</strong>
        </h1>
        <div className={styles.links}>
          <ul>
            <li><a href="/keys/gpg" target="_blank">GPG</a></li>
            <li><a href="/keys/ssh" target="_blank">SSH</a></li>
            <li><a href="/addresses/btc" target="_blank">BTC</a></li>
          </ul>
          <ul>
            <li>
              <a
                href="https://github.com/n4vysh"
                target="_blank"
                rel="noopener noreferrer"
              >
                GitHub
              </a>
            </li>
            <li>
              <a
                href="https://tryhackme.com/p/n4vysh"
                target="_blank"
                rel="noopener noreferrer"
              >
                TryHackMe
              </a>
            </li>
            <li>
              <a
                href="https://app.hackthebox.com/profile/1366449"
                target="_blank"
                rel="noopener noreferrer"
              >
                HackTheBox
              </a>
            </li>
          </ul>
        </div>
      </div>
    </main>
  )
}
