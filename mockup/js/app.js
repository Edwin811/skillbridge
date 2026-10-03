/**
 * SKILLBRIDGE — Interactive Mockup Logic
 * Supports role switching, screen navigation, interactive map routing, 
 * job application flow, and design system inspection.
 */

// Job Database for dynamic detail binding
const JOBS_DATA = {
  'kopi-sentosa': {
    title: 'REDESIGN MENU & FEED INSTAGRAM',
    company: 'Kopi Sentosa Cafe • Senopati',
    category: 'Product & Content Design',
    deadline: 'Deadline Oct 20, 2026 • 5 Hari Pengerjaan',
    salary: 'Rp 2.500.000',
    escrow: 'Rp 2.500.000',
    image: 'assets/images/coffee_shop.jpg',
    goal: 'Membangun sebuah design style dan guideline yang bisa digunakan oleh barista & admin UMKM dalam membuat konten visual serta promosi media sosial secara konsisten dan menarik pelanggan muda.',
    keyPoints: [
      'Color, Typography, dan Grid Template feed',
      '9 Desain Feed Instagram + 3 Story Template (Canva/Figma)',
      'Desain Menu Meja & Barcode QRIS Siap Cetak',
      'Handbook Panduan Barista & Mini Tutoring 1 Jam'
    ],
    skills: ['Canva Pro', 'Figma', 'Instagram Marketing', 'Copywriting']
  },
  'desain-brand': {
    title: 'UI/UX & BRAND GUIDE UMKM',
    company: 'Batik Kinanti Boutique • Kemang',
    category: 'Branding & E-Commerce',
    deadline: 'Deadline Oct 28, 2026 • 10 Hari Pengerjaan',
    salary: 'Rp 3.500.000',
    escrow: 'Rp 3.500.000',
    image: 'assets/images/design_workspace.jpg',
    goal: 'Mengembangkan identitas visual toko batik online, foto katalog produk modern untuk Shopee & Tokopedia, serta panduan warna kemasan ramah lingkungan.',
    keyPoints: [
      'Logo refresh & Palet Warna Brand Guideline',
      'Desain Template Banner Toko Tokopedia & Shopee',
      'Panduan Fotografi Produk dengan Smartphone',
      'Packaging Sleeve Design untuk kotak hampers batik'
    ],
    skills: ['Adobe Photoshop', 'Figma', 'Product Photography', 'Branding']
  },
  'kas-excel': {
    title: 'DATA ANALYST & PEMBUKUAN KAS EXCEL',
    company: 'Toko Grosir Barokah • Tebet',
    category: 'Finance & Administration',
    deadline: 'Deadline Oct 24, 2026 • 4 Hari Pengerjaan',
    salary: 'Rp 1.500.000',
    escrow: 'Rp 1.500.000',
    image: 'assets/images/bookkeeping.jpg',
    goal: 'Merapikan pencatatan stok barang masuk-keluar harian ke dalam template Excel otomatis dengan formula laba-rugi sederhana yang mudah diisi kasir.',
    keyPoints: [
      'Template Excel Buku Kas Harian & Laba Rugi',
      'Dashboard Grafik Penjualan Barang Terlaris per Bulan',
      'Formula Otomatis Peringatan Stok Menipis',
      'Pelatihan 45 Menit untuk Kasir Toko'
    ],
    skills: ['Microsoft Excel', 'Data Entry', 'Akuntansi Sederhana', 'Financial Dashboard']
  }
};

let currentScale = 1.0;
let currentRole = 'student'; // 'student' or 'umkm'

// Initialize on DOM load
document.addEventListener('DOMContentLoaded', () => {
  console.log('SkillBridge Mockup initialized.');
});

/**
 * Switch Studio Top Mode (Simulator / Multi Showcase / Design System)
 */
function switchStudioMode(mode) {
  const tabSim = document.getElementById('tabPhoneSimulator');
  const tabShow = document.getElementById('tabMultiShowcase');
  const tabDS = document.getElementById('tabDesignSystem');

  const viewSim = document.getElementById('viewSimulator');
  const viewShow = document.getElementById('viewMultiShowcase');
  const viewDS = document.getElementById('viewDesignSystem');

  tabSim.classList.remove('active');
  tabShow.classList.remove('active');
  tabDS.classList.remove('active');

  viewSim.style.display = 'none';
  viewShow.classList.remove('active');
  viewDS.classList.remove('active');

  if (mode === 'simulator') {
    tabSim.classList.add('active');
    viewSim.style.display = 'block';
  } else if (mode === 'showcase') {
    tabShow.classList.add('active');
    viewShow.classList.add('active');
  } else if (mode === 'design-system') {
    tabDS.classList.add('active');
    viewDS.classList.add('active');
  }
}

/**
 * Switch Perspective: Student (Mahasiswa) vs UMKM Owner
 */
function switchUserRole(role) {
  currentRole = role;
  const btnStudent = document.getElementById('btnRoleStudent');
  const btnUMKM = document.getElementById('btnRoleUMKM');
  const btnUmkmPostNav = document.getElementById('btnUmkmPostNav');

  btnStudent.classList.toggle('active', role === 'student');
  btnUMKM.classList.toggle('active', role === 'umkm');

  if (role === 'umkm') {
    btnUmkmPostNav.style.display = 'inline-flex';
    navToScreen('screen-umkm-post');
    showToast('Beralih ke Mode Pemilik UMKM (Pasang Kebutuhan Micro-Job)');
  } else {
    btnUmkmPostNav.style.display = 'none';
    navToScreen('screen-home');
    showToast('Beralih ke Mode Mahasiswa (Cari Lowongan & Portofolio)');
  }
}

/**
 * Navigate to phone screen inside simulator
 */
function navToScreen(screenId) {
  // Hide all screens
  document.querySelectorAll('.screen-container').forEach(screen => {
    screen.classList.remove('active');
  });

  // Activate selected screen
  const target = document.getElementById(screenId);
  if (target) {
    target.classList.add('active');
  }

  // Update top toolbar buttons
  document.querySelectorAll('.screen-btn').forEach(btn => {
    btn.classList.toggle('active', btn.getAttribute('data-screen') === screenId);
  });

  // Update bottom nav active state
  const bHome = document.getElementById('bNavHome');
  const bNearby = document.getElementById('bNavNearby');
  const bChat = document.getElementById('bNavChat');
  const bProfile = document.getElementById('bNavProfile');

  bHome.classList.remove('active');
  bNearby.classList.remove('active');
  bChat.classList.remove('active');
  bProfile.classList.remove('active');

  if (screenId === 'screen-home') bHome.classList.add('active');
  else if (screenId === 'screen-nearby') bNearby.classList.add('active');
  else if (screenId === 'screen-chat') bChat.classList.add('active');
  else if (screenId === 'screen-profile') bProfile.classList.add('active');

  // Adjust phone status bar theme based on header color
  const statusBar = document.getElementById('phoneStatusBar');
  if (screenId === 'screen-detail' || screenId === 'screen-success' || screenId === 'screen-umkm-post') {
    statusBar.classList.add('status-bar-dark');
  } else {
    statusBar.classList.remove('status-bar-dark');
  }

  // Scroll viewport to top
  const viewport = document.getElementById('viewport');
  if (viewport) {
    viewport.scrollTop = 0;
  }
}

/**
 * Open Job Details dynamically
 */
function openJobDetail(jobKey) {
  const data = JOBS_DATA[jobKey] || JOBS_DATA['kopi-sentosa'];

  document.getElementById('detailJobHeading').innerText = data.title;
  document.getElementById('detailSubCategory').innerText = data.company;
  document.getElementById('detailCategoryTag').innerText = data.category;
  document.getElementById('detailProjectGoal').innerText = data.goal;
  document.getElementById('detailSalaryLarge').innerText = data.salary;
  document.getElementById('detailEscrowTxt').innerText = data.escrow;
  document.getElementById('detailBannerImg').src = data.image;

  // Build key points list
  const pointsContainer = document.getElementById('detailKeyPoints');
  pointsContainer.innerHTML = '';
  data.keyPoints.forEach(point => {
    const item = document.createElement('div');
    item.className = 'key-point-item';
    item.innerHTML = `
      <span class="point-bull-icon"></span>
      <span>${point}</span>
    `;
    pointsContainer.appendChild(item);
  });

  navToScreen('screen-detail');
}

/**
 * Interactive Map Pin Selection
 */
function selectMapPin(pinId, x, y, distance, title, umkm, salary, imgPath) {
  // Reset all pins
  document.querySelectorAll('.map-job-pin').forEach(pin => pin.classList.remove('selected'));
  
  // Highlight clicked pin
  const clickedPin = document.getElementById(`pin-${pinId}`);
  if (clickedPin) {
    clickedPin.classList.add('selected');
  }

  // Update Route Polyline in SVG
  const routePolyline = document.getElementById('routePolyline');
  // Student is fixed at (65, 490)
  if (pinId === 'kopi-sentosa') {
    routePolyline.setAttribute('points', '65,490 65,315 125,315 125,210 265,210 265,115');
    document.getElementById('mapDistanceTooltip').style.left = '170px';
    document.getElementById('mapDistanceTooltip').style.top = '210px';
  } else if (pinId === 'batik-lestari') {
    routePolyline.setAttribute('points', '65,490 120,490 120,385 260,385 260,310 310,310');
    document.getElementById('mapDistanceTooltip').style.left = '200px';
    document.getElementById('mapDistanceTooltip').style.top = '385px';
  } else if (pinId === 'toko-grosir') {
    routePolyline.setAttribute('points', '65,490 65,525 120,525 120,600');
    document.getElementById('mapDistanceTooltip').style.left = '95px';
    document.getElementById('mapDistanceTooltip').style.top = '525px';
  }

  // Update Tooltip
  document.getElementById('distanceVal').innerText = distance;

  // Update Bottom Sheet
  document.getElementById('sheetTitle').innerText = title;
  document.getElementById('sheetUmkm').innerText = `${umkm} • ${distance}`;
  document.getElementById('sheetSalary').innerText = salary;
  document.getElementById('sheetImg').src = imgPath;
}

/**
 * Cycle Map Radius Filter (3 KM -> 5 KM -> 10 KM -> 1 KM)
 */
let radiusState = 1;
function cycleMapRadius() {
  const radii = ['1 KM', '3 KM', '5 KM', '10 KM'];
  radiusState = (radiusState + 1) % radii.length;
  document.getElementById('radiusLabel').innerText = `Radius: ${radii[radiusState]}`;
  showToast(`Peta diperbarui untuk radius ${radii[radiusState]}`);
}

/**
 * Bookmark toggle
 */
function toggleBookmark(e, btn) {
  e.stopPropagation();
  btn.classList.toggle('bookmarked');
  const isBookmarked = btn.classList.contains('bookmarked');
  showToast(isBookmarked ? 'Pekerjaan disimpan ke daftar favorit!' : 'Dihapus dari favorit.');
}

/**
 * Filter Categories in Home
 */
function filterCategory(btn, cat) {
  document.querySelectorAll('.category-pill').forEach(p => p.classList.remove('active'));
  btn.classList.add('active');
  showToast(`Menampilkan kategori: ${btn.innerText}`);
}

/**
 * Application Modal Flow
 */
function openApplyModal() {
  document.getElementById('applyModalOverlay').classList.add('open');
}

function closeApplyModal() {
  document.getElementById('applyModalOverlay').classList.remove('open');
}

function submitApplication() {
  closeApplyModal();
  showToast('Mengirimkan lamaran & memverifikasi skor keahlian..');
  setTimeout(() => {
    navToScreen('screen-success');
  }, 450);
}

/**
 * Send Simulated Chat Message
 */
function sendChatMessage() {
  const input = document.getElementById('chatInput');
  const text = input.value.trim();
  if (!text) return;

  const chatStream = document.getElementById('chatStream');

  // Student bubble
  const studentBubble = document.createElement('div');
  studentBubble.className = 'chat-bubble student-msg';
  const now = new Date();
  const timeStr = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;
  studentBubble.innerHTML = `
    ${escapeHtml(text)}
    <div class="chat-timestamp">${timeStr}</div>
  `;
  chatStream.appendChild(studentBubble);
  input.value = '';
  chatStream.scrollTop = chatStream.scrollHeight;

  // Automated UMKM Response after 1 second
  setTimeout(() => {
    const umkmBubble = document.createElement('div');
    umkmBubble.className = 'chat-bubble umkm-msg';
    umkmBubble.innerHTML = `
      Baik Edwin, pesanmu sudah kami terima. Brief final sudah lengkap di sistem SkillBridge!
      <div class="chat-timestamp">${timeStr}</div>
    `;
    chatStream.appendChild(umkmBubble);
    chatStream.scrollTop = chatStream.scrollHeight;
  }, 1000);
}

/**
 * Submit UMKM Post Job
 */
function submitUmkmPost() {
  const title = document.getElementById('postJobTitle').value;
  const budget = document.getElementById('postJobBudget').value;
  showToast(`Lowongan "${title}" dengan SafePay ${budget} berhasil dipublikasikan!`);
  setTimeout(() => {
    navToScreen('screen-home');
  }, 800);
}

/**
 * Zoom Scale Adjuster
 */
function adjustScale(delta) {
  currentScale = Math.min(Math.max(currentScale + delta, 0.75), 1.25);
  const wrapper = document.getElementById('phoneWrapper');
  wrapper.style.transform = `scale(${currentScale})`;
  document.getElementById('scaleIndicator').innerText = `${Math.round(currentScale * 100)}%`;
}

/**
 * Copy Hex to clipboard
 */
function copyHex(hex) {
  navigator.clipboard.writeText(hex).then(() => {
    showToast(`Warna ${hex} berhasil disalin ke clipboard!`);
  }).catch(() => {
    showToast(`Warna: ${hex}`);
  });
}

/**
 * Toast Notification Helper
 */
function showToast(msg) {
  const toast = document.getElementById('toastNotice');
  toast.innerText = msg;
  toast.style.display = 'block';
  clearTimeout(window.toastTimer);
  window.toastTimer = setTimeout(() => {
    toast.style.display = 'none';
  }, 2600);
}

function showFilterModal() {
  showToast('Filter: Menyesuaikan Lokasi Terdekat, Budget Minimum, dan Kategori Skill..');
}

function escapeHtml(string) {
  return String(string).replace(/[&<>"']/g, function(s) {
    return {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#39;'
    }[s];
  });
}
