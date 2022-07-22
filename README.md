# notion wordbook

Notion で作った単語リストをクイズとして勉強に役立てることができるアプリです。

## 開発情報

議事録とかはいってます。

<https://www.notion.so/torkralle/Flutter-Notion-Wordbook-5f00dd3da30f412786784dadbcd3ff41>

## スクリーンショット

開発中の画面をちょい見せします。

### 単語帳一覧

notion で作った複数の単語帳を接続できます。

#### 単語帳が保存されていない時の画面

notion のDBと接続されていないため、まずは接続して単語帳を追加します。

<img src="https://user-images.githubusercontent.com/18581236/180404975-6f60c031-edeb-450c-a591-0f0b92fc5186.jpeg" height=500 name=worbook_list_empty></img>

#### 単語帳が一つ追加された時の画面

単語帳をタップすることでクイズが始められるようになりました。

<img src="https://user-images.githubusercontent.com/18581236/180405323-8e3682fa-36d7-414b-a4e0-fd61fb04b468.jpeg" height=500 name=worbook_list_added></img>

#### メニュー

単語帳長押しで管理用のメニューが出てきます。

<img src="https://user-images.githubusercontent.com/18581236/180405583-6c76cd5f-536c-48e8-9f69-6fb9d1b39055.jpeg" height=500 name=menu></img>

### 単語帳接続

#### 必要情報入力画面

単語帳の名前や notion で発行した API キーなどを入力します。

<img src="https://user-images.githubusercontent.com/18581236/180405107-84ea85e7-7c03-408a-9c9a-9fa1983db2bf.jpeg" height=500 name=connection_input></img>

#### 入力情報を間違えた時の画面

Notion 側の権限や入力情報に誤りがあった時にエラーを返すようになっています。

<img src="https://user-images.githubusercontent.com/18581236/180405225-25339b18-2098-44f6-97d4-1f7610033313.jpeg" height=500 name=connection_failed></img>

### クイズ画面

単語帳をタップすることで簡単なクイズができるようになっています。正誤情報は notion へと送られ、 DB が更新されます。

<img src="https://user-images.githubusercontent.com/18581236/180405391-671efd7e-f6ab-46ad-9213-7d62fee28cbf.jpeg" height=500 name=quiz></img>

### クイズ結果画面

クイズの正誤の結果と成長率が一覧できます。

<img src="https://user-images.githubusercontent.com/18581236/180405480-ca6eaf47-fdaa-4fc3-a9fa-c563ccb39c0d.jpeg" height=500 name=result></img>
