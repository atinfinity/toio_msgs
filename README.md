# toio_msgs

[![colcon-test](https://github.com/atinfinity/toio_msgs/actions/workflows/colcon-test.yml/badge.svg)](https://github.com/atinfinity/toio_msgs/actions/workflows/colcon-test.yml)

toio Core Cube の LED パターンと メロディ を表現する ROS 2 メッセージ定義。

[toio_ros2](https://github.com/atinfinity/toio_ros2) が使う。単色点灯
(`std_msgs/ColorRGBA`) と組み込み効果音 (`std_msgs/UInt8`) は `std_msgs` の
まま扱えるが、点滅パターンとメロディは「配列 + 繰り返し回数」を要求するため
`std_msgs` の素の型では表現できない。

## メッセージ

| メッセージ | 内容 |
|:---|:---|
| `Led` | 色 + 点灯時間。コマンド毎に点灯時間を変えたいとき |
| `LedPattern` | `Led` の並び + 繰り返し回数。点滅パターン |
| `MidiNote` | 音長 + MIDIノート番号 + 音量 |
| `Melody` | `MidiNote` の並び + 繰り返し回数 |

パターンとメロディはキューブ側で再生される。ホストから1コマンドずつ
publish する場合と違い、タイミングがホストの publish 精度に依存せず、
BLE が一時的に切れても再生が続く。

## 仕様上の制約

toio の BLE 仕様に由来する制約があり、各メッセージに定数として入れてある。

- **点灯時間 / 音長**: 10ms 単位。10ms 未満の端数は切り捨て、2550ms 超は
  クリップされる。`Led` は 10ms 未満を「時間制限なし」として扱う
- **配列長**: `LedPattern.steps` は 29 個まで、`Melody.notes` は 59 音まで
- **MIDIノート番号**: 0-128。128 は休符
- **音量**: 0 が消音で、それ以外はすべて最大音量という二値

これらは toio.py 側では検証されないため、送信側で守る必要がある。

## ビルド

```bash
cd ~/ros2_ws/src
git clone https://github.com/atinfinity/toio_msgs.git
cd ~/ros2_ws
colcon build --packages-select toio_msgs
```

## 参考

- <https://toio.github.io/toio-spec/docs/ble_light>
- <https://toio.github.io/toio-spec/docs/ble_sound>
